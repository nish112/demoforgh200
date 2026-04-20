# 1. Use the official lightweight Node.js image
FROM node:20-alpine

# 2. Set the working directory
WORKDIR /app

# 3. Copy package files from the root
COPY package.json ./

# 4. Install dependencies
RUN npm install

# 5. Copy the math.js from the 'src' folder on GitHub to the root of /app in container
# Format: COPY <source_on_github> <destination_in_container>
COPY src/math.js ./

# 6. Create the output folder
RUN mkdir -p output

# 7. OPTION B: Execute directly (Note: math.js is now in /app/math.js)
CMD ["node", "math.js", "10", "20"]
