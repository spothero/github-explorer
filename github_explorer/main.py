from github import Github
import os


class GitHubProxy:
    def __init__(self):
        access_token = os.environ['GITHUB_ACCESS_TOKEN']
        g = Github(access_token)
        self.org = g.get_organization('spothero')
        self.org.login


    def public_repos(self):
        return self.org.get_repos(type='public')


def run():
    gp = GitHubProxy()

    repos = gp.public_repos()

    for repo in repos:
        print(repo)
