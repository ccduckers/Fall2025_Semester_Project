"""Implements the applicatin user interface."""

from prettytable import PrettyTable;
from TutorMatchmaker.application_base import ApplicationBase
from TutorMatchmaker.service_layer.app_services import AppServices
import inspect
import json

class UserInterface(ApplicationBase):
    """UserInterface Class Definition."""
    def __init__(self, config:dict)->None:
        """Initializes object. """
        self._config_dict = config
        self.META = config["meta"]
        super().__init__(subclass_name=self.__class__.__name__, 
				   logfile_prefix_name=self.META["log_prefix"])
        self.DB = AppServices(config)
        self._logger.log_debug(f'{inspect.currentframe().f_code.co_name}:It works!')




    def start(self):
        """Start main user interface."""
        self._logger.log_debug(f'{inspect.currentframe().f_code.co_name}: User interface started!')
        while True:
            userin = input("Enter a command option: \n\t1) View Tutors 2) Add Tutor 3) Delete Tutor 4) View Subject 5) Add Subject 6) Delete Subject 9) Exit \n")
            match userin:
                case "1":
                    self._logger.log_debug(f'{inspect.currentframe().f_code.co_name}: User selected option 1')
                    results = self.DB.get_all_tutors()
                    table = PrettyTable()
                    table.field_names = ["Tutor ID","First Name","Last Name",]
                    for row in results:
                        table.add_row(row)
                    print(table)
                case "2":
                    addFname = input("Enter a First name: ")
                    addLname = input("Enter a Last name: ")
                    results=self.DB.insert_tutor(addFname, addLname)
                case "3":
                    deleteID = input("Enter ID to delete")
                    results=self.DB.delete_tutor(deleteID)
                case "4":
                    self._logger.log_debug(f'{inspect.currentframe().f_code.co_name}: User selected option 4 (View Subjects)')
                    results = self.DB.get_all_subjects()
                    table = PrettyTable()
                    table.field_names = ["Subject ID", "Subject"]
                    for row in results:
                        table.add_row(row)
                    print(table)
                case "5":
                    self._logger.log_debug(
                        f'{inspect.currentframe().f_code.co_name}: User selected option 5 (Add Subject)'
                    )
                    subject_name = input("Enter a subject name: ")
                    results = self.DB.insert_subject(subject_name)
                    print(f"Inserted {results} subject record(s).")
                case "6":
                    self._logger.log_debug(
                        f'{inspect.currentframe().f_code.co_name}: User selected option 6 (Delete Subject)'
                    )
                    subject_id = input("Enter Subject ID to delete: ")
                    results = self.DB.delete_subject(subject_id)
                    print(f"Deleted {results} subject record(s).")

                case "9":
                    break