# Ollama Microservice

**Group 10 - ENGR 5590G: Software Engineering Studio**  
**Members:** Zaeem Khalid, Zubair Islam, David Abiola

---
## Table of Contents
- [Getting Started](#getting-started)
  - [Clone the Repository](#1-clone-the-repository)
  - [Set Up a Virtual Environment](#2-set-up-a-virtual-environment)
  - [Install Dependencies](#3-install-dependencies)
  - [Run the Service](#4-run-the-service)
- [Testing the LLM Model with Postman](#testing-the-llm-model-with-postman)
  - [Create a POST Request](#1-create-a-post-request)
  - [Enter Prompt in JSON Format](#2-enter-prompt-in-json-format)
  - [Send the Request](#3-send-the-request)
  - [View the Response](#4-view-the-response)
- [Notes](#notes)

## Getting Started

### 1. Clone the Repository
```sh
git clone https://github.com/Zaes1453/Ollama-Microservice
cd Ollama-Microservice
```

### 2. Set Up a Virtual Environment
Create a Python virtual environment:
```sh
python3 -m venv venv
```

Activate the virtual environment:
- **Linux/macOS:**
  ```sh
  source venv/bin/activate
  ```
- **Windows:**
  ```sh
  venv\Scripts\activate
  ```

### 3. Install Dependencies
```sh
pip install -r requirements.txt
```

### 4. Run the Service
```sh
python3 llm_service.py
```

**Note:** This microservice uses the **Mistral** model via **Ollama** to generate text responses. Ensure **Ollama** is installed and accessible in your system.

## Testing the LLM Model with Postman

1. Open **Postman**.
2. Create a **POST request** to the following URL:
   ```
   http://127.0.0.1:5000/generate
   ```
   **(Do not click send yet.)**

   ![Postman Request](https://github.com/user-attachments/assets/72daa609-b6a2-41b4-a032-fa548ba2fd9c)

3. In the **Body** tab, use **raw JSON** format and enter your prompt:
   ```json
   {
       "prompt": "<Your question here>"
   }
   ```
   **Example:**
   ```json
   {
       "prompt": "How many days are there in a year?"
   }
   ```
   ![Example Request](https://github.com/user-attachments/assets/864d74cc-4f4a-4b72-9671-0889cab0c555)

4. Click **Send**. The request will process for a moment while the LLM generates a response.

5. View the response output at the bottom of Postman:
   ![Response Output](https://github.com/user-attachments/assets/f68c3a17-2821-486e-8f24-34184b693a9a)

6. You will also see logs in the terminal where the service is running, indicating a successful request and response:
   ![Terminal Log](https://github.com/user-attachments/assets/e20e7724-3ac1-483c-ad56-e7a380a2f431)

## Notes
- Ensure your virtual environment is activated before running the service.
- The API must be running (`python3 llm_generate_prompt.py`) before making requests in Postman.
- This microservice runs the **Mistral** LLM using **Ollama**.
- Ensure that **Ollama** is installed and accessible in your system before running the service.
- If you encounter errors, check the terminal logs for more details.
