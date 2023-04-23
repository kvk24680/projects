### Github API Integration Script

#### How to run the script
1. Store values in variables used by the script
   
```bash
export password=[your github password]
```

2. Run the script

The second parameter passed to the script is fetched from [Github API Reference](https://docs.github.com/en/rest/repos/repos?apiVersion=2022-11-28#list-organization-repositories). To fetch the repos in a github organization, the default format is **/orgs/{org}/repos**

```bash
./github-api-integration-module.sh [your github token] [REST expression]

# To get list of repos
./github-api-integration-module.sh $password /orgs/kvk24680/repos

# To get the list of users
./github-api-integration-module.sh $password /user
```
