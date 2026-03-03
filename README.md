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
* **AWS EKS (Elastic Kubernetes Service)**
* **GitHub Actions**

---

## 🔧 Como funciona o Pipeline

Sempre que houver um push na branch **main**, o GitHub Actions:

1. Faz checkout do repositório
2. Compila o projeto com Maven
3. Gera o WAR em `target/`
4. Atualiza a imagem no registry**
4. Utiliza o terraform para provisionar em EKS da AWS**
5. Substitui a imagem em producao no EKS
6. Faz os testes com Argo
---

## 🔐 Secrets necessários no GitHub

Crie os seguintes secrets em **Settings → Secrets → Actions**:

| Secret                  | Descrição        |
| ------------------------| -----------------|
| `DOCKERHUB_USER`        | Dockerhub User                  |
| `DOCKERHUB_PASSWORD`    | Dockerhub Pawd                  |


---

🎯 Resultado Terraform

Você terá:

Cluster ECS

Container rodando em Fargate

Escalável

Sem precisar gerenciar EC2
---
