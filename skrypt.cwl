#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: sh
stdout: output_skrypt.txt
inputs:
  runner_path:
    type: File
    inputBinding:
      position: 1
outputs:
  output:
    type: stdout
