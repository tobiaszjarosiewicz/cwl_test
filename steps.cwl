#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
inputs:
  tarball: File
  name_of_file_to_extract: string

outputs:
  steps_output:
    type: File
    outputSource: skrypt/output

steps:
  untar:
    run: tar-param.cwl
    in:
      tarfile: tarball
      extractfile: name_of_file_to_extract
    out: [extracted_file]
    hints:
      ResourceRequirement:
        coresMin: 80
        coresMax: 85
        tmpdirMin: 2000
        ramMin: 4000
  skrypt:
    run: skrypt.cwl
    in:
      runner_path: untar/extracted_file
    out: [output]
    hints:
      ResourceRequirement:
        coresMin: 160
        coresMax: 162
        tmpdirMin: 9000
        ramMin: 30000
