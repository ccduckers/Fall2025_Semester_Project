"""Implements the applicatin user interface."""


from TutorMatchmaker.application_base import ApplicationBase
from TutorMatchmaker.service_layer.app_services import AppServices
import inspect
import json
from prettytable import PrettyTable

#graphical interface for user to interact with
class UserInterface(ApplicationBase):
    """UserInterface Class Definition."""
    def __init__(self, config:dict)->None:
        """Initializes object. """
        self._config_dict = config # initialize private attribute _config_dict to the config argument
        self.META = config["meta"] # initialize attribute "META" to the value associated with the "meta" key from the config argument
        super().__init__(subclass_name=self.__class__.__name__, # initialize instance of parent class "ApplicationBase" 
				   logfile_prefix_name=self.META["log_prefix"])
        self.app_services = AppServices(config) # initialize attribute "DB" as an instance of "AppServices"
        self._logger.log_debug(f'{inspect.currentframe().f_code.co_name}:It works!') # prints logs to the console




    def start(self):
        """Start main user interface."""
        self._logger.log_debug(f'{inspect.currentframe().f_code.co_name}: User interface started!') # prints logs to the console
        while True:
            userin = input("Enter a command option: \n\t1) View Tutors \n\t2) Add Tutor \n\t3) Delete Tutor \n\t4) View Subject \n\t5) Add Subject \n\t6) Delete Subject \n\t7) Link Tutor to Subject \n\t8) Show Subjects for a Tutor \n\t9) Show Tutors for a Subject \n\t0) Exit \n")
            match userin:
                case "1":
                    self._logger.log_debug(f'{inspect.currentframe().f_code.co_name}: User selected option 1')
                    results = self.app_services.get_all_tutors()
                    table = PrettyTable()
                    table.field_names = ["Tutor ID","First Name","Last Name",]
                    for row in results:
                        table.add_row(row)
                    print(table)
                case "2":
                    addFname = input("Enter a First name: ")
                    addLname = input("Enter a Last name: ")
                    results=self.app_services.insert_tutor(addFname, addLname)
                case "3":
                    deleteID = input("Enter ID to delete")
                    results=self.app_services.delete_tutor(deleteID)
                case "4":
                    self._logger.log_debug(f'{inspect.currentframe().f_code.co_name}: User selected option 4 (View Subjects)')
                    results = self.app_services.get_all_subjects()
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
                    results = self.app_services.insert_subject(subject_name)
                    print(f"Inserted {results} subject record(s).")
                case "6":
                    self._logger.log_debug(
                        f'{inspect.currentframe().f_code.co_name}: User selected option 6 (Delete Subject)'
                    )
                    subject_id = input("Enter Subject ID to delete: ")
                    results = self.app_services.delete_subject(subject_id)
                    print(f"Deleted {results} subject record(s).")
                case "7":
                    self._logger.log_debug(
                        f'{inspect.currentframe().f_code.co_name}: User selected option 7 (Link Tutor to Subject)'
                    )

                    # Show tutors so user can pick an ID
                    print("\nCurrent Tutors:")
                    tutors = self.app_services.get_all_tutors()
                    tutor_table = PrettyTable()
                    tutor_table.field_names = ["Tutor ID", "First Name", "Last Name"]
                    for row in tutors:
                        tutor_table.add_row(row)
                    print(tutor_table)

                    # Show subjects so user can pick an ID
                    print("\nCurrent Subjects:")
                    subjects = self.app_services.get_all_subjects()
                    subject_table = PrettyTable()
                    subject_table.field_names = ["Subject ID", "Subject"]
                    for row in subjects:
                        subject_table.add_row(row)
                    print(subject_table)

                    # Get user choices
                    tutor_id = input("Enter the Tutor ID to link: ")
                    subject_id = input("Enter the Subject ID to link: ")

                    results = self.app_services.link_tutor_to_subject(tutor_id, subject_id)
                    print(f"Created {results} tutor-subject link(s).")
                case "8":
                    self._logger.log_debug(
                        f'{inspect.currentframe().f_code.co_name}: User selected option 8 (Show Subjects for a Tutor)'
                    )

                    # Show tutors so user can see valid IDs
                    print("\nCurrent Tutors:")
                    tutors = self.app_services.get_all_tutors()
                    tutor_table = PrettyTable()
                    tutor_table.field_names = ["Tutor ID", "First Name", "Last Name"]
                    for row in tutors:
                        tutor_table.add_row(row)
                    print(tutor_table)

                    tutor_id = input("Enter the Tutor ID to view their subjects: ")
                    results = self.app_services.get_subjects_for_tutor(tutor_id)

                    subject_table = PrettyTable()
                    subject_table.field_names = ["Subject ID", "Subject"]
                    for row in results:
                        subject_table.add_row(row)
                    print("\nSubjects for selected tutor:")
                    print(subject_table)
                case "9":
                    self._logger.log_debug(
                        f'{inspect.currentframe().f_code.co_name}: User selected option 9 (Show Tutors for a Subject)'
                    )

                    # Show subjects so user can see valid IDs
                    print("\nCurrent Subjects:")
                    subjects = self.app_services.get_all_subjects()
                    subject_table = PrettyTable()
                    subject_table.field_names = ["Subject ID", "Subject"]
                    for row in subjects:
                        subject_table.add_row(row)
                    print(subject_table)

                    subject_id = input("Enter the Subject ID to view its tutors: ")
                    results = self.app_services.get_tutors_for_subject(subject_id)

                    tutor_table = PrettyTable()
                    tutor_table.field_names = ["Tutor ID", "First Name", "Last Name"]
                    for row in results:
                        tutor_table.add_row(row)
                    print("\nTutors for selected subject:")
                    print(tutor_table)



                case "0":
                    break