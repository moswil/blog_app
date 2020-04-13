from django.shortcuts import render

posts = [
    {
        'author': 'Moses Wilfred',
        'title': 'Blog Post 1',
        'content': 'First Blog Post',
        'date_posted': 'April 12, 2020'
    },
    {
        'author': 'Emmah Moraa',
        'title': 'Blog Post 2',
        'content': 'Second Blog Post',
        'date_posted': 'April 13, 2020'
    }
]


def home(request):
    context = {
        'posts': posts
    }
    return render(request, 'blog/home.html', context)


def about(request):
    return render(request, 'blog/about.html', {'title': 'Project'})
