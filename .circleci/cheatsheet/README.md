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
export POKUS_PRJ_FOLER="./steps/go.dev/doc/tutorial/getting-started/hello-pokus"
export DOCKERIZE_ME=true
# ---
# Trigger the pipeline for the last
# commit on a given git branch :
curl -X POST \
  --header "Circle-Token: ${MY_CIRCLE_TOKEN}" \
  --header 'content-type: application/json' \
  -d "{
        \"branch\":\"feature/first-step\",
        \"parameters\": {
            \"dockerize_me\": ${DOCKERIZE_ME},
            \"pokus_go_version\": \"1.18.3\",
            \"project_folder\": \"${POKUS_PRJ_FOLER}\",
            \"gopkg_auth_secret_user\": \"pokus\",
            \"gopkg_auth_secret_pwd\": \"pokus\",
            \"dockerhub_auth_secret_user\": \"pokus\",
            \"dockerhub_auth_secret_pwd\": \"pokus\"
        }
    }" \
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


With newman and a postman collection : 

```bash
export PATH="$PATH:/C/Users/Utilisateur/AppData/Local/pnpm"
pnpm add --global newman
newman --version
echo $MY_CIRCLECI_TOKEN

export MY_CIRCLE_TOKEN="xxxxxxxxxxxxxxxxxxxxxxxxxxx"
export MY_CIRCLE_TOKEN="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
export GIT_SERVICE_PROVIDER="gh"
export GIT_SERVICE_USER_OR_ORG_OR_GRP="pokusio"
export GIT_SERVICE_PRJ_NAME="further-golang"
export CCI_PROJ_SLUG="${GIT_SERVICE_PROVIDER}/${GIT_SERVICE_USER_OR_ORG_OR_GRP}/${GIT_SERVICE_PRJ_NAME}"
export POKUS_PRJ_FOLER="./steps/go.dev/doc/tutorial/getting-started/hello-pokus"
export DOCKERIZE_ME=true




export PATH="$PATH:/C/Users/Utilisateur/AppData/Local/pnpm"
export MY_CIRCLE_TOKEN="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
export MY_CIRCLE_TOKEN="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
export POKUS_PRJ_FOLDER="./steps/go.dev/doc/tutorial/getting-started/hello-pokus"



cp ./Trigger_CircleCI_Pipeline.postman_collection.json ./Trigger_CircleCI_Pipeline.example.postman_collection.json

sed -i "s#{{MY_CIRCLECI_TOKEN}}#${MY_CIRCLECI_TOKEN}#g" ./Trigger_CircleCI_Pipeline.example.postman_collection.json
sed -i "s#{{POKUS_PRJ_FOLDER}}#${POKUS_PRJ_FOLDER}#g" ./Trigger_CircleCI_Pipeline.example.postman_collection.json

newman run ./Trigger_CircleCI_Pipeline.example.postman_collection.json



# --
# i fail at using en env file 
cat <<EOF >./pokus.env.json
{
  "id": "ef26db11-9932-472b-8803-2aeb76423522",
  "values": [
    {
      "type": "any",
      "value": "${MY_CIRCLECI_TOKEN}",
      "key": "MY_CIRCLECI_TOKEN"
    },
    {
      "type": "any",
      "value": "${POKUS_PRJ_FOLER}",
      "key": "POKUS_PRJ_FOLER"
    }
  ],
  "name": "environment",
  "_postman_variable_scope": "environment",
  "_postman_exported_at": "2023-03-17T03:09:43.424Z",
  "_postman_exported_using": "Newman/5.3.2"
}
EOF
# ---
# this fails at interpolating env vars
newman run --env-var MY_CIRCLECI_TOKEN=${MY_CIRCLECI_TOKEN} \
           --env-var POKUS_PRJ_FOLER=${POKUS_PRJ_FOLER} \
           ./Trigger_CircleCI_Pipeline.postman_collection.json
newman run -e ./pokus.env.json \
           ./Trigger_CircleCI_Pipeline.postman_collection.json

# https://github.com/postmanlabs/postman-docs/blob/develop/src/pages/docs/sending-requests/variables.md

```

## References

* https://circleci.com/docs/env-vars/
* https://circleci.com/docs/api/v2/index.html#operation/triggerPipeline