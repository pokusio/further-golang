## CI/CD Guide


### Trigger The pipeline for a project


There's a `CirlceCI` pipeline defined in this repo.

to trigger running the pipline, for a given project, using the path of the project in this project execute : 

```bash

export MY_CIRCLE_TOKEN="xxxxxxxxxxxxxxxxxxxxxxxxxxx"
export GIT_SERVICE_PROVIDER="gh"
export GIT_SERVICE_USER_OR_ORG_OR_GRP="pokusio"
export GIT_SERVICE_PRJ_NAME="further-golang"
export CCI_PROJ_SLUG="${GIT_SERVICE_PROVIDER}/${GIT_SERVICE_USER_OR_ORG_OR_GRP}/${GIT_SERVICE_PRJ_NAME}"

# ---
# Trigger the pipeline for the last
# commit on a given git branch :
curl -X POST \
  --header "Circle-Token: ${MY_CIRCLE_TOKEN}" \
  --header 'content-type: application/json' \
  -d '{
        "branch":"feature/first-step",
        "parameters": {
            "dockerize_me": false,
            "pokus_go_version": "1.18.3",
            "project_folder": "./myspecialdir",
            "gopkg_auth_secret_user": "pokus",
            "gopkg_auth_secret_pwd": "pokus",
            "dockerhub_auth_secret_user": "pokus",
            "dockerhub_auth_secret_pwd": "pokus"
        }
    }' \
  --url https://circleci.com/api/v2/project/${CCI_PROJ_SLUG}/pipeline

# ---
# Trigger the pipeline for a given git tag :
curl -X POST \
  --header "Circle-Token: ${MY_CIRCLE_TOKEN}" \
  --header 'content-type: application/json' \
  -d '{
        "tag":"v3.1.4159",
        "parameters": {
            "dockerize_me": false,
            "pokus_go_version": "1.18.3",
            "project_folder": "./myspecialdir",
            "gopkg_auth_secret_user": "pokus",
            "gopkg_auth_secret_pwd": "pokus",
            "dockerhub_auth_secret_user": "pokus",
            "dockerhub_auth_secret_pwd": "pokus"
        }
    }' \
  --url https://circleci.com/api/v2/project/${CCI_PROJ_SLUG}/pipeline


```




## References

* https://circleci.com/docs/env-vars/
* https://circleci.com/docs/api/v2/index.html#operation/triggerPipeline