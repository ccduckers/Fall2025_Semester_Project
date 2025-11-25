"""Implements AppServices Class."""

from TutorMatchmaker.application_base import ApplicationBase
from TutorMatchmaker.persistence_layer.mysql_persistence_wrapper import MySQLPersistenceWrapper
import inspect

class AppServices(ApplicationBase):
    """AppServices Class Definition."""
    def __init__(self, config:dict)->None:
        """Initializes object. """
        self._config_dict = config
        self.META = config["meta"]
        super().__init__(subclass_name=self.__class__.__name__, 
				   logfile_prefix_name=self.META["log_prefix"])
        self.DB = MySQLPersistenceWrapper(config)
        self._logger.log_debug(f'{inspect.currentframe().f_code.co_name}:It works!')

    def get_all_subjects(self) -> list:
        """Returns all subjects in the database."""
        self._logger.log_debug(
            f'{inspect.currentframe().f_code.co_name}: Getting all subjects.'
        )
        results = self.DB.getallsubjects()
        return results

    
    def get_all_tutors(self)->list:
        """Returns all tutors in the database."""
        self._logger.log_debug(f'{inspect.currentframe().f_code.co_name}: Getting all tutors.')
        results = self.DB.getalltutors()
        return results
    
    def insert_tutor(self, firstname, lastname)->list:
        self._logger.log_debug(f'{inspect.currentframe().f_code.co_name}: Inserting tutor {firstname} {lastname}.')
        results = self.DB.inserttutor(firstname, lastname)
        return results
    
    def delete_tutor(self, idTutor)->list:
        self._logger.log_debug(f'{inspect.currentframe().f_code.co_name}: Deleting tutor.')
        results = self.DB.deletetutor(idTutor)
        return results
    
    def insert_subject(self, subject_name) -> list:
        """Insert a new subject."""
        self._logger.log_debug(
            f'{inspect.currentframe().f_code.co_name}: Inserting subject {subject_name}.'
        )
        results = self.DB.insertsubject(subject_name)
        return results
    
    def delete_subject(self, subject_id) -> list:
        """Delete a subject by id."""
        self._logger.log_debug(
            f'{inspect.currentframe().f_code.co_name}: Deleting subject {subject_id}.'
        )
        results = self.DB.deletesubject(subject_id)
        return results


