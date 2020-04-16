from django.test import TestCase

from . models import Post


class PostTestCase(TestCase):
    def test_base(self):
        assert 1 == 1
