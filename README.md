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
3. In the **Body** tab, use **raw JSON** and enter your prompt:

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
4. Click **Send**. The request will process for a moment while the LLM generates a response.
   
5.View the response output at the bottom of Postman.

6.You will also see logs in the terminal where the service is running, indicating a successful request and response.

## Notes
- Ensure your virtual environment is activated before running the service.
- The API must be running (python3 llm_generate_prompt.py) before making requests in Postman.
- This microservice runs the Mistral LLM using Ollama.
- Ensure that Ollama is installed and accessible in your system before running the service.
- If you encounter errors, check the terminal logs for more details.

# Service Discovery Using Consul
This document explains how to set up a service discovery agent using Consul to enable communication between microservices running on two different machine.

# Prerequisites
1. **Consul Installation**: Ensure Consul is installed on both machines. You can download it from:
   ```
    https://www.consul.io/downloads
   ```
2.**Network Access**: Both machines must be on the same network (e.g., the university network) to enable connectivity via their IP addresses.

3. **Microservice Applications**: Two microservices, set up to register with Consul.

# Setup Instructions
1. **Start the Consul Server**: On the server machine, start Consul by specifying your university network IP:
   ```
    consul agent -server -bootstrap-expect=1 -node=server-node -bind=SERVER_IP -ui
   ```
2. **Connect the Consul Agent**: On the agent machine, start Consul and connect it to the server’s IP:
   ```
    consul agent -node=agent-node -bind=AGENT_IP -join=SERVER_IP
   ```
   The agent will automatically connect to the Consul server. You can verify the connection using the Consul UI or CLI. The Consul server UI is accessible at:
   ```
   http://localhost:8500/ui
   ```
3.**Run the Microservices**
- Microservice 1 (Adventure): Start Microservice 1, ensuring it registers with the local Consul agent.
- Microservice 2 (Elephant): Start Microservice 2 similarly.

4. **Test Service Discovery**: With both microservices running, test their communication. For example, execute
   ```
   curl http://Microservice1IP:Port/generate
   curl http://Microservice2IP:Port/generate
   ```
   Verify in the Consul UI that both services are registered and actively communicating.
