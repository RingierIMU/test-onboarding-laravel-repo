"""
This script is used to parse a Terraform file and retrieve the value of a specific variable.
It takes a target variable string as a command line argument in the format
"TARGET_VARIABLE:TARGET_VALUE". The script reads the Terraform file from stdin and searches
for the target variable. If the variable is found, it retrieves the value associated with
the target value. If the value is found, it prints the value to stdout. If the variable or
value is not found, it prints an error message to stderr and exits with a non-zero status code.

Dependencies:
- hcl2: This library is used to parse the Terraform file in HCL2 format.
    You can install it using pip: `pip install bc-python-hcl2`
"""

import sys
import logging
import os
import hcl2


log_level = os.environ.get("TVP_LOG_LEVEL", "DEBUG")

logging.basicConfig(
    level=log_level,
    datefmt="%Y-%m-%d %H:%M:%S",
    format="[%(asctime)s] [%(levelname)s] [%(filename)s] - %(message)s",
)


def filter_type_by_value(input_dict, value, target_variable_name, target_value) -> bool:
    """
    This function filters a dictionary based on a given value. It then checks if a target variable
    name exists in the filtered dictionary. If the target variable name exists, it attempts to get
    the value of a target value from the details of the filtered dictionary. If the target value
    exists, it removes leading '${' and trailing '}' from the value and prints it.

    Parameters:
    input_dict (dict): The dictionary to filter.
    value (any): The value to filter the dictionary by.
    target_variable_name (str): The name of the target variable to check in the filtered dictionary.
    target_value (str): The name of the target value to get from the filtered dictionary details.

    Returns:
    Boolean: True if the target value is found, False otherwise.
    """
    for filtered_dict in input_dict.get(value, []):
        logging.debug("filtered_dict: %s", filtered_dict)
        for filtered_name, filtered_details in filtered_dict.items():
            if target_variable_name == filtered_name:
                logging.debug("filtered_name: %s", filtered_name)
                logging.debug("filtered_details: %s", filtered_details)

                # try get the target_value value if it exists
                output_value = filtered_details.get(target_value)
                logging.debug("default output value: %s", output_value)
                if output_value is not None:
                    value = ""
                    # ensure that we only get first element if value is a list
                    if isinstance(output_value,list):
                        value = output_value[0]
                    else:
                        value = output_value
                    # remove leading ${ and trailing }
                    print_value = value.replace("${", "").replace("}", "")
                    logging.debug("using print value: %s", print_value)
                    print(f"{print_value}")
                    return True

                available_keys = filtered_details.keys()
                print(f"Available keys: {available_keys}")
    return False


def parse_terraform_file(string_input):
    """
    This function parses the Terraform file from stdin and searches for the target variable.
    If the variable is found, it retrieves the value associated with the target value. If the
    value is found, it prints the value to stdout. If the variable or value is not found, it
    prints an error message to stderr and exits with a non-zero status code.

    Parameters:
    string_input (str): The target variable string in the format "TARGET_VARIABLE:TARGET_VALUE".
    """
    # Split the variable string into variable name and default value
    target_name, target_value = string_input.split(":")

    # log out target_name and target_value
    logging.debug("target_name: %s", target_name)
    logging.debug("target_value: %s", target_value)

    # Read the Terraform file from stdin
    tf_config = hcl2.load(sys.stdin)

    if filter_type_by_value(tf_config, "provider", target_name, target_value):
        return
    if filter_type_by_value(tf_config, "variable", target_name, target_value):
        return

    sys.stderr.write(
        f'Error: Terraform variable "{target_name}" and "{target_value}" not found in file\n'
    )
    sys.exit(1)


try:
    # Get the variable string argument from command line
    variable_string = sys.argv[1]
except IndexError:
    # There were no configuration arguments, notify the user and exit
    sys.stderr.write(
        'No target variable to parse, the pipeline needs a terraform variable and the desired \
            object to get its value\nUsage: terraform-variable-parse.py \
                "TARGET_VARIABLE:TARGET_VALUE" < _variables.tf>\n'
    )
    sys.exit(1)

# Call the function to parse the Terraform file
parse_terraform_file(variable_string)
