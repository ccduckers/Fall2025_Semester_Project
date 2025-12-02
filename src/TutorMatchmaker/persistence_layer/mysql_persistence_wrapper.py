"""Defines the MySQLPersistenceWrapper class."""

from TutorMatchmaker.application_base import ApplicationBase
from mysql import connector
from mysql.connector.pooling import (MySQLConnectionPool)
import inspect
import json

class MySQLPersistenceWrapper(ApplicationBase):
	"""Implements the MySQLPersistenceWrapper class."""

	def __init__(self, config:dict)->None:
		"""Initializes object. """
		self._config_dict = config
		self.META = config["meta"]
		self.DATABASE = config["database"]
		super().__init__(subclass_name=self.__class__.__name__, 
				   logfile_prefix_name=self.META["log_prefix"])
		self._logger.log_debug(f'{inspect.currentframe().f_code.co_name}:It works!')

		# Database Configuration Constants
		self.DB_CONFIG = {}
		self.DB_CONFIG['database'] = \
			self.DATABASE["connection"]["config"]["database"]
		self.DB_CONFIG['user'] = self.DATABASE["connection"]["config"]["user"]
		self.DB_CONFIG['host'] = self.DATABASE["connection"]["config"]["host"]
		self.DB_CONFIG['password'] = self.DATABASE["connection"]["config"]["password"]
		self.DB_CONFIG['port'] = self.DATABASE["connection"]["config"]["port"]

		self._logger.log_debug(f'{inspect.currentframe().f_code.co_name}: DB Connection Config Dict: {self.DB_CONFIG}')

		# Database Connection
		self._connection_pool = \
			self._initialize_database_connection_pool(self.DB_CONFIG)
		

		# SQL String Constants
		self.INSERT_TUTOR = f'INSERT INTO Tutor(FirstName, LastName) VALUES (%s, %s);'
		self.DELETE_TUTOR = f'DELETE FROM Tutor WHERE idTutors = %s;'

		self.INSERT_TUTOR_SUBJECT = f'INSERT INTO Subject_has_Tutors (idSubject, idTutors) VALUES (%s, %s);'
		self.DELETE_TUTOR_SUBJECT = f'DELETE FROM Subject_has_Tutors WHERE idSubject = %s AND idTutors = %s;'


		self.INSERT_SUBJECT = f'INSERT INTO Subject(Subject) VALUES (%s);'
		self.DELETE_SUBJECT = f'DELETE FROM Subject WHERE idSubject = %s;'

		self.SELECT_SUBJECTS_FOR_TUTOR = """
            SELECT s.idSubject, s.Subject
            FROM Subject s
            JOIN Subject_has_Tutors sht
                ON s.idSubject = sht.idSubject
            WHERE sht.idTutors = %s;
        """
		self.SELECT_TUTORS_FOR_SUBJECT = """
            SELECT t.idTutors, t.FirstName, t.LastName
            FROM Tutor t
            JOIN Subject_has_Tutors sht
                ON t.idTutors = sht.idTutors
            WHERE sht.idSubject = %s;
        """





    # SQL String Constants -- These are used by the methods below to execute queries and operations and protect against SQL attacks.
        # READ Statements

		self.SELECT_ALL_SUBJECTS = f"SELECT idSubject, Subject FROM `Subject`;"
		self.SELECT_ALL_TUTORS = f"SELECT idTutors, firstname, lastname FROM `Tutor`;"
        
		



	# MySQLPersistenceWrapper Methods

	def getalltutors(self):
		self._logger.log_debug(f'{inspect.currentframe().f_code.co_name}: Getting all tutors')
		try:
			self._logger.log_debug(f'{inspect.currentframe().f_code.co_name}: Running query: {self.SELECT_ALL_TUTORS}')
			connection = self._connection_pool.get_connection()
			db_cursor = connection.cursor(dictionary=False)
			db_cursor.execute(self.SELECT_ALL_TUTORS, )
			results = db_cursor.fetchall()
			db_cursor.close()
			connection.close()
			return results
		except connector.Error as err:
			self._logger.log_error(f'{inspect.currentframe().f_code.co_name}: MySQL error: {err}')
			return []
		except Exception as e:
			self._logger.log_error(f'{inspect.currentframe().f_code.co_name}: General error: {e}')
			return []
	
	def getallsubjects(self):
		self._logger.log_debug(f'{inspect.currentframe().f_code.co_name}: Getting all subjects')
		try:
			self._logger.log_debug(
            	    f'{inspect.currentframe().f_code.co_name}: Running query: {self.SELECT_ALL_SUBJECTS}'
            )
			connection = self._connection_pool.get_connection()
			db_cursor = connection.cursor(dictionary=False)
			db_cursor.execute(self.SELECT_ALL_SUBJECTS)
			results = db_cursor.fetchall()
			db_cursor.close()
			connection.close()
			return results
		except connector.Error as err:
			self._logger.log_error(
                f'{inspect.currentframe().f_code.co_name}: MySQL error: {err}'
            )
			return 
		except Exception as e:
			self._logger.log_error(
                f'{inspect.currentframe().f_code.co_name}: General error: {e}'
            )
			return

		
		
	def inserttutor(self, firstname, lastname):
		self._logger.log_debug(f'{inspect.currentframe().f_code.co_name}: Inserting a tutor')
		try:
			self._logger.log_debug(f'{inspect.currentframe().f_code.co_name}: Running query: {self.INSERT_TUTOR}')
			connection = self._connection_pool.get_connection()
			db_cursor = connection.cursor(dictionary=False)
			db_cursor.execute(self.INSERT_TUTOR,(firstname, lastname) )
			results = db_cursor.rowcount
			connection.commit()
			db_cursor.close()
			connection.close()
			return results
		except connector.Error as err:
			self._logger.log_error(f'{inspect.currentframe().f_code.co_name}: MySQL error: {err}')
			return []
		except Exception as e:
			self._logger.log_error(f'{inspect.currentframe().f_code.co_name}: General error: {e}')
			return []
		
	def deletetutor(self, idTutor):
		self._logger.log_debug(f'{inspect.currentframe().f_code.co_name}: Deleting a tutor')
		try:
			self._logger.log_debug(f'{inspect.currentframe().f_code.co_name}: Running query: {self.DELETE_TUTOR}')
			connection = self._connection_pool.get_connection()
			db_cursor = connection.cursor(dictionary=False)
			db_cursor.execute(self.DELETE_TUTOR,(idTutor,) )
			results = db_cursor.rowcount
			connection.commit()
			db_cursor.close()
			connection.close()
			return results
		except connector.Error as err:
			self._logger.log_error(f'{inspect.currentframe().f_code.co_name}: MySQL error: {err}')
			return []
		except Exception as e:
			self._logger.log_error(f'{inspect.currentframe().f_code.co_name}: General error: {e}')
			return []

	def insertsubject(self, subject_name):
		"""Insert a new subject."""
		self._logger.log_debug(
            f'{inspect.currentframe().f_code.co_name}: Inserting a subject'
		)
		try:
			self._logger.log_debug(
                f'{inspect.currentframe().f_code.co_name}: Running query: {self.INSERT_SUBJECT}'
            )
			connection = self._connection_pool.get_connection()
			db_cursor = connection.cursor(dictionary=False)
			db_cursor.execute(self.INSERT_SUBJECT, (subject_name,))
			results = db_cursor.rowcount
			connection.commit()
			db_cursor.close()
			connection.close()
			return results
		except connector.Error as err:
			self._logger.log_error(
                f'{inspect.currentframe().f_code.co_name}: MySQL error: {err}'
            )
			return
		except Exception as e:
			self._logger.log_error(
                f'{inspect.currentframe().f_code.co_name}: General error: {e}'
            )
			return
		
	def deletesubject(self, subject_id):
		"""Delete a subject by id."""
		self._logger.log_debug(
            f'{inspect.currentframe().f_code.co_name}: Deleting subject {subject_id}'
        )
		try:
			self._logger.log_debug(
                f'{inspect.currentframe().f_code.co_name}: Running query: {self.DELETE_SUBJECT}'
            )
			connection = self._connection_pool.get_connection()
			db_cursor = connection.cursor(dictionary=False)
			db_cursor.execute(self.DELETE_SUBJECT, (subject_id,))
			results = db_cursor.rowcount
			connection.commit()
			db_cursor.close()
			connection.close()
			return results
		except connector.Error as err:
			self._logger.log_error(
                f'{inspect.currentframe().f_code.co_name}: MySQL error: {err}'
            )
			return
		except Exception as e:
			self._logger.log_error(
                f'{inspect.currentframe().f_code.co_name}: General error: {e}'
            )
			return 

	def linktutorsubject(self, subject_id, tutor_id):
		"""Create a link between a subject and a tutor."""
		self._logger.log_debug(
            f'{inspect.currentframe().f_code.co_name}: Linking tutor {tutor_id} to subject {subject_id}'
        )
		try:
			self._logger.log_debug(
                f'{inspect.currentframe().f_code.co_name}: Running query: {self.INSERT_TUTOR_SUBJECT}'
            )
			connection = self._connection_pool.get_connection()
			db_cursor = connection.cursor(dictionary=False)
			db_cursor.execute(self.INSERT_TUTOR_SUBJECT, (subject_id, tutor_id))
			results = db_cursor.rowcount
			connection.commit()
			db_cursor.close()
			connection.close()
			return results
		except connector.Error as err:
			self._logger.log_error(
                f'{inspect.currentframe().f_code.co_name}: MySQL error: {err}'
            )
			return
		except Exception as e:
			self._logger.log_error(
                f'{inspect.currentframe().f_code.co_name}: General error: {e}'
            )
			return
		
	def unlinktutorsubject(self, subject_id, tutor_id):
		"""Remove the link between a subject and a tutor."""
		self._logger.log_debug(
            f'{inspect.currentframe().f_code.co_name}: Unlinking tutor {tutor_id} from subject {subject_id}'
        )
		try:
			self._logger.log_debug(
                f'{inspect.currentframe().f_code.co_name}: Running query: {self.DELETE_TUTOR_SUBJECT}'
            )
			connection = self._connection_pool.get_connection()
			db_cursor = connection.cursor(dictionary=False)
			db_cursor.execute(self.DELETE_TUTOR_SUBJECT, (subject_id, tutor_id))
			results = db_cursor.rowcount
			connection.commit()
			db_cursor.close()
			connection.close()
			return results
		except connector.Error as err:
			self._logger.log_error(
                f'{inspect.currentframe().f_code.co_name}: MySQL error: {err}'
            )
			return
		except Exception as e:
			self._logger.log_error(
                f'{inspect.currentframe().f_code.co_name}: General error: {e}'
            )
			return

		
	def getsubjectsfortutor(self, tutor_id):
		"""Return all subjects associated with a given tutor id."""
		self._logger.log_debug(
            f'{inspect.currentframe().f_code.co_name}: Getting subjects for tutor {tutor_id}'
        )
		try:
			connection = self._connection_pool.get_connection()
			db_cursor = connection.cursor(dictionary=False)
			db_cursor.execute(self.SELECT_SUBJECTS_FOR_TUTOR, (tutor_id,))
			results = db_cursor.fetchall()
			db_cursor.close()
			connection.close()
			return results
		except connector.Error as err:
			self._logger.log_error(
                f'{inspect.currentframe().f_code.co_name}: MySQL error: {err}'
            )
			return 
		except Exception as e:
			self._logger.log_error(
                f'{inspect.currentframe().f_code.co_name}: General error: {e}'
            )
			return
		
	def gettutorsforsubject(self, subject_id):
		"""Return all tutors associated with a given subject id."""
		self._logger.log_debug(
            f'{inspect.currentframe().f_code.co_name}: Getting tutors for subject {subject_id}'
        )
		try:
			connection = self._connection_pool.get_connection()
			db_cursor = connection.cursor(dictionary=False)
			db_cursor.execute(self.SELECT_TUTORS_FOR_SUBJECT, (subject_id,))
			results = db_cursor.fetchall()
			db_cursor.close()
			connection.close()
			return results
		except connector.Error as err:
			self._logger.log_error(
                f'{inspect.currentframe().f_code.co_name}: MySQL error: {err}'
            )
			return 
		except Exception as e:
			self._logger.log_error(
                f'{inspect.currentframe().f_code.co_name}: General error: {e}'
            )
			return



		##### Private Utility Methods #####

	def _initialize_database_connection_pool(self, config:dict)->MySQLConnectionPool:
		"""Initializes database connection pool."""
		try:
			self._logger.log_debug(f'Creating connection pool...')
			cnx_pool = \
				MySQLConnectionPool(pool_name = self.DATABASE["pool"]["name"],
					pool_size=self.DATABASE["pool"]["size"],
					pool_reset_session=self.DATABASE["pool"]["reset_session"],
					use_pure=self.DATABASE["pool"]["use_pure"],
					**config)
			self._logger.log_debug(f'{inspect.currentframe().f_code.co_name}: Connection pool successfully created!')
			return cnx_pool
		except connector.Error as err:
			self._logger.log_error(f'{inspect.currentframe().f_code.co_name}: Problem creating connection pool: {err}')
			self._logger.log_error(f'{inspect.currentframe().f_code.co_name}: Check DB cnfg:\n{json.dumps(self.DATABASE)}')
		except Exception as e:
			self._logger.log_error(f'{inspect.currentframe().f_code.co_name}:Problem creating connection pool: {e}')
			self._logger.log_error(f'{inspect.currentframe().f_code.co_name}:Check DB conf:\n{json.dumps(self.DATABASE)}')
