# Bitbucket Pipelines Pipe: Google Datastore export

Pipe to export Datastore to Cloud Storage.

## YAML Definition

Add the following snippet to the script section of your `bitbucket-pipelines.yml` file:

```yaml
- pipe: tohero/google-datastore-export:1.0.0
  variables:
    KEY_FILE: '<string>'
    PROJECT: '<string>'
    DESTINATION: '<string>'
    # DEBUG: '<boolean>' # Optional.
```

## Variables

| Variable        | Usage                                                                                                                                                                                                                          |
|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| KEY_FILE (*)    | base64 encoded content of Key file for a [Google service account](https://cloud.google.com/iam/docs/creating-managing-service-account-keys). To encode this content, follow [encode private key doc][encode-string-to-base64]. |
| PROJECT (*)     | The Project ID of the project that owns the app to deploy.                                                                                                                                                                     |
| DESTINATION (*) | Cloud storage destination (without gs://).                                                                                                                                                                                     |
| DEBUG           | Turn on extra debug information. Default `false`.                                                                                                                                                                              |

_(*) = required variable._

## Details

With the Google Datastore export pipe you can export your Datastore into Cloud Storage destination.
All [gcloud components][gcloud components] are installed.

## Prerequisites

* An IAM user is configured with sufficient permissions to perform a gcloud datastore export and write on Cloud Storage destination.
* You have [enabled APIs and services](https://cloud.google.com/service-usage/docs/enable-disable) needed for your application.

## Examples

### Basic example:

```yaml
script:
  - pipe: tohero/google-datastore-export:1.0.0
    variables:
      KEY_FILE: $KEY_FILE
      PROJECT: 'my-project'
      DESTINATION: 'export.my-project.com/my-export'
```

## Deployment

```
docker build -t tohero/google-datastore-export .
docker push tohero/google-datastore-export
``` 

## License
Apache 2.0 licensed, see [LICENSE.txt](LICENSE.txt) file.

[encode-string-to-base64]: https://confluence.atlassian.com/bitbucket/use-ssh-keys-in-bitbucket-pipelines-847452940.html#UseSSHkeysinBitbucketPipelines-UsemultipleSSHkeysinyourpipeline
[gcloud components]: https://cloud.google.com/sdk/docs/components#additional_components
