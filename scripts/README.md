# Scripts

- `run-pipeline-locally.sh`: this script runs the pipeline locally.
- `set-up-repo.sh`: this script sets up the repo, including downloading the SHACL file, generating a template Excel file,
   and generating example data.
- `generate-rdf-build-miravi-locally.sh`: this script generates the RDF and builds Miravi for local testing.
   It relies on `generate-rdf-build-miravi.sh`.
- `clone-ap-data-to-dashboard.sh`: this script clones the `ap-data-to-dashboard` repo in the `tmp` folder,
  if it doesn't exist yet.
- `copy-dashboard-config.sh`: this script copies the content of the `dashboard-config` folder to
  the corresponding folder in the `ap-data-to-dashboard` folder.
- `download-shacl.sh`: this script downloads the SHACL file,
  if it doesn't exist yet.
- `generate-rdf-build-miravi.sh`: this script generates the RDF and builds Miravi.
   The script `generate-rdf-build-miravi-locally.sh` and `/.github/workflows/pipeline.yml` use this script.
- `install-ap-data-to-dashboard.sh`: this script installs `ap-data-to-dashboard` and runs its setup script.
- `move-miravi-dist.sh`: this script moves the `dist` folder created by Miravi
  to correct subfolder in the `gh-pages` folder.
- `reset-readme.sh`: this script reset `README.md` to the state it was in when the repository was created.
- `reset-repo.sh`: this script reset the repository to the state it was in when it was created.
- `update-readme.sh`: this script updates `README.md` with the application profile and SHACL urls.
