import base64

from typing import List, Dict
from sys import argv


def decode_b64_to_string(string: str) -> str:
    """
    Função responsável por fazer o decode do base64

    Recebe uma string no formato de base64 e converte para utf-8

    Parameters
    ----------
    string
        str

    Returns
    -------
    str
        utf-8 string
    """
    return base64.b64decode(string).decode("utf-8")


def load_file(env_file: str) -> List[str]:
    with open(env_file, "r") as f:
        file_content = f.readlines()
    return file_content


def write_string_env(key_value_dict: Dict[str, str]) -> str:
    return "".join(key + "=" + value for key, value in key_value_dict.items())

def write_dotenv(string: str) -> None:
    with open(".env", "w") as f:
        f.write(string)

if __name__ == "__main__":
    env_file = argv[1]
    file_content = load_file(env_file)

    new_env_args = []
    string = ""
    for line in file_content:
        key, value = line.split(": ")
        new_line = write_string_env({key: decode_b64_to_string(value)})
        string += new_line + '\n'
    write_dotenv(string)
    print("writed")
