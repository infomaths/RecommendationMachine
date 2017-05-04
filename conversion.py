print ("start")

INPUT_FILE_NAME = "C:\\Users\\susan\\Documents\\movies.txt"
OUTPUT_FILE_NAME = "C:\\Users\\susan\\Documents\\Output.csv"

header = [
    "product/productId",
    "review/userId",
    "review/profileName",
    "review/helpfulness",
    "review/score",
    "review/time",
    "review/summary",
    "review/text"]

f = open(INPUT_FILE_NAME)
outfile = open(OUTPUT_FILE_NAME,"w")

# Write header
outfile.write(",".join(header) + "\n")

currentLine = []
for line in f:
   line = line.strip()
   if line == "": 
      outfile.write(",".join(currentLine))
      outfile.write("\n")
      currentLine = []
      continue
   parts = line.split(":",1)
   currentLine.append(parts[1])

if currentLine != []:
    outfile.write(",".join(currentLine))


f.close()
outfile.close()
print ("end")
