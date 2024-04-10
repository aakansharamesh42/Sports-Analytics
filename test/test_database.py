from django.test import TestCase
from django.db import DatabaseError, connections
from django.db.utils import OperationalError
from test.models import Player

class DatabaseConnectionTest(TestCase):
    def test_database_connection(self):
        try:

            Player.objects.all().exists()
            connection_working = True
        except (OperationalError, DatabaseError):
            connection_working = False

        self.assertTrue(connection_working, "Database connection failed or is unavailable")
