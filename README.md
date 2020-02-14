# locationiq-clients-openapi

The repo is used for the openapi specification file and the bash script to generate client sdks using openapi generator

## Specification file:
The `liq_api_spec_openapi3_v1_0_0` contains the specifiation of our LocationIQ API. It is written in openapi 3.0.

## Generate sdks:
The script `create.sh` is used generate sdks in various languages. This downloads the generator if the generator jar file is not present in the folder.

Change the version on the script for any updates on the API

To run and upload to location-iq github repo, 
1) Check for `spec` file, `version` in `create.sh` script
2) Run `bash create.sh github_username` in the terminal from the repo location
3) Run `bash push_clients.sh release_notes` in the terminal to push the respective language folders to their respective repos

Once generated, every folder has a `gitpush.sh` that can be run via `bash gitpush.sh` from terminal to upload to the respective git repo.

### References for sdk generation & options:

```
OPTIONS to use along with the openapi-generator
        
                [(-a <authorization> | --auth <authorization>)]
                [--additional-properties <additional properties>...]
                [--api-package <api package>] [--artifact-id <artifact id>]
                [--artifact-version <artifact version>]
                [(-c <configuration file> | --config <configuration file>)]
                [-D <system properties>...] [--git-repo-id <git repo id>]
                [--git-user-id <git user id>] [--group-id <group id>]
                [--http-user-agent <http user agent>]
                (-i <spec file> | --input-spec <spec file>)
                [--ignore-file-override <ignore file override location>]
                [--import-mappings <import mappings>...]
                [--instantiation-types <instantiation types>...]
                [--invoker-package <invoker package>]
                (-l <language> | --lang <language>)
                [--language-specific-primitives <language specific primitives>...]
                [--library <library>] [--model-name-prefix <model name prefix>]
                [--model-name-suffix <model name suffix>]
                [--model-package <model package>]
                [(-o <output directory> | --output <output directory>)]
                [--release-note <release note>] [--remove-operation-id-prefix]
                [--reserved-words-mappings <reserved word mappings>...]
                [(-s | --skip-overwrite)]
                [(-t <template directory> | --template-dir <template directory>)]
                [--type-mappings <type mappings>...] [(-v | --verbose)]
```

### Troubleshooting

If the "create" bash script doesn't work and gives an error like unable to access jar file.
Then check for the latest version jar link at https://github.com/OpenAPITools/openapi-generator

### Points to Note
- Set **normalizecity** param in the API to 1.
- We don't support **polygon** param in clients.
- In reverseAPI, params - osmid & osmtype have been removed from clients.
Either combination of lat-long can be used or osmid and osmtype but not both together.