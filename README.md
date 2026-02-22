# 🚀 Basic CI/CD Pipeline

Pipeline básico para deploy automático de uma aplicação **Java (WAR)** em um servidor **Apache Tomcat** rodando na **AWS EC2**.

Este projeto demonstra uma estrutura simples e funcional de CI/CD utilizando **GitHub Actions**, realizando:

* Build da aplicação Java
* Geração do arquivo `.war`
* Upload para o servidor EC2
* Deploy automático no Tomcat

---

## 📦 Tecnologias Utilizadas

* **Java 17+**
* **Maven**
* **Apache Tomcat 9+**
* **AWS EC2 (Amazon Linux ou Ubuntu)**
* **GitHub Actions**

---

## 🔧 Como funciona o Pipeline

Sempre que houver um push na branch **main**, o GitHub Actions:

1. Faz checkout do repositório
2. Compila o projeto com Maven
3. Gera o WAR em `target/`
4. Envia o arquivo para a EC2 via **SSH/SCP**
5. Substitui a aplicação no Tomcat
6. Reinicia o serviço para aplicar o deploy

---

## 🔐 Secrets necessários no GitHub

Crie os seguintes secrets em **Settings → Secrets → Actions**:

| Secret        | Descrição                                     |
| ------------- | --------------------------------------------- |
| `EC2_SSH_KEY` | Chave privada (.pem) usada para acessar a EC2 |
| `EC2_HOST`    | IP público da instância                       |
| `EC2_USER`    | Usuário SSH (ex.: `ec2-user`)                 |

---

## 📘 Tutorial Completo (Notion)

O passo a passo completo de configuração da EC2, Tomcat, SSH e GitHub Actions está disponível no Notion:

🔗 **[https://www.notion.so/Basic-Pipeline-2af76206858a8038b900fc258f1a369e](https://www.notion.so/Basic-Pipeline-2af76206858a8038b900fc258f1a369e)**

---
