.# 🚀 Basic CI/CD Pipeline

Pipeline básico para deploy automático de uma aplicação **Java (WAR)** em um servidor **Apache Tomcat** rodando na **AWS ECS**.

Este projeto demonstra uma estrutura simples e funcional de CI/CD utilizando **GitHub Actions**, realizando:

* Build da aplicação Java
* Geração do arquivo `.war`
* Upload para AWS ECS
---

## 📦 Tecnologias Utilizadas

* **Java 17+**
* **Maven**
* **Docker image Apache Tomcat 9+**
* **AWS ECS (Elastic Container Service)**
* **GitHub Actions**

---

## 🔧 Como funciona o Pipeline

Sempre que houver um push na branch **main**, o GitHub Actions:

1. Faz checkout do repositório
2. Compila o projeto com Maven
3. Gera o WAR em `target/`
4. Atualiza a imagem no registry**
5. Substitui a imagem em producao no ECS

---

## 🔐 Secrets necessários no GitHub

Crie os seguintes secrets em **Settings → Secrets → Actions**:

| Secret               | Descrição                                     |
| ---------------------| --------------------------------------------- |
| `ECS_HOST`           | IP público da instância                       |
| `ECS_USER`           | Usuário SSH (ex.: `ec2-user`)                 |
| `DOCKER_PASSWORD`    | Usuário SSH (ex.: `ec2-user`)                 |
| `DOCKER_USERNAME`    | Usuário SSH (ex.: `ec2-user`)                 |

---

## 📘 Tutorial Completo (Notion)
---
