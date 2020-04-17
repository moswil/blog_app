from django.test import TestCase

from blog.models import Post


class PostTestCase(TestCase):

    def test_post(self):
        post = Post(title="First Blog", content="First Blog Content")
        self.assertEqual(post.title, "First Blog")
        self.assertEqual(post.content, "First Blog Content")
