#!/bin/bash

# Script to concatenate individual Markdown files into a master document

# Define the output file
output_file="GAIA-QAO_Master_Document.md"

# List of input files in the desired order
input_files=(
  "00_Framework_Overview.md"
  "01_Software_Technologies.md"
  "02_HIL_Thinking.md"
  "03_GQOIS_Object_ID.md"
  "04_Entangled_Accountability_Protocol.md"
  "05_Photonic_Sustainability_Loop.md"
  "06_QEP_Optical_Design.md"
  "07_Phase_1_Implementation_Roadmap.md"
  "08_QSI_Interactive_Calculator.md"
  "09_Implementation_Guidelines.md"
  "Appendix_A_ST_Codes.md"
  "Appendix_B_Diagrams.md"
  "Appendix_C_Templates.md"
)

# Remove the output file if it exists
if [ -f "$output_file" ]; then
  rm "$output_file"
fi

# Concatenate the input files into the output file
for file in "${input_files[@]}"; do
  if [ -f "$file" ]; then
    cat "$file" >> "$output_file"
    echo -e "\n" >> "$output_file"
  else
    echo "Warning: $file not found."
  fi
done

echo "Master document generated: $output_file"
