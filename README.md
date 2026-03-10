.# 🚀 Basic CI/CD Pipeline

Este projeto contém diversas tarefas automatizadas que ajudam no ciclo de vida e operação da aplicação Java:

### 1. **Build da Aplicação**
- Compilação do código fonte Java usando Maven.
- Geração do arquivo `.war` pronto para deploy.

### 2. **Criação e Push da Imagem Docker**
- Empacotamento da aplicação WAR em uma imagem Docker baseada no Tomcat 9+.
- Autenticação no Docker Hub e push automático da imagem para o registry.

### 3. **Provisionamento de Infraestrutura**
- Uso do **Terraform** para criar e atualizar recursos na AWS:
  - Cluster ECS Fargate
  - Serviços ECS gerenciando containers para aplicação e banco de dados
  - Configuração de redes, subnets, grupos de segurança e roles

### 4. **Deploy automatizado via GitHub Actions**
- Pipeline CI/CD automatizando build, criação da imagem, push para o registry e aplicação das mudanças de infraestrutura na AWS.

### 5. **Testes e Validações**
- Execução de testes automáticos (unitários e, opcionalmente, integrações) durante o pipeline.
- Validação do deploy: confirmação que o novo container está rodando corretamente.

### 6. **Escalabilidade e Monitoramento**
- Configuração para fácil escalonamento da quantidade de containers.
- Infraestrutura pronta para integração com ferramentas de monitoramento da AWS.

### 7. **Gerenciamento de Secrets**
- Utilização de **GitHub Secrets** para variáveis sensíveis do pipeline (senhas, tokens, etc).

---

Caso precise executar tarefas manualmente (como `terraform init`, `terraform apply` ou builds locais com Maven/Docker), siga as instruções nos scripts individuais ou consulte as seções abaixo.
  
Para dúvidas técnicas sobre qualquer tarefa, consulte a documentação do respectivo serviço (Terraform, AWS, GitHub Actions, Maven ou Docker).

---

## 📦 Tecnologias Utilizadas

* **Java 17+**
* **Maven**
* **Shell Script**
* **Docker**
* **AWS ECS (Elastic Container Service)**
* **AWS EKS (Elastic Kubernetes Service)**
* **GitHub Actions**
* **Terraform**
* **PostgreSQL**


* **
---

| Secret                  | Descrição                                       |
|-------------------------|-------------------------------------------------|
| `GITHUB_SSH_KEY`        | Chave SSH privada para deploy/automações GitHub |
| `DOCKERHUB_USER`        | Usuário do Docker Hub                           |
| `DOCKERHUB_PASSWORD`    | Senha do Docker Hub                             |
| `AWS_ACCESS_KEY`        | Access Key ID da AWS                            |
| `AWS_ACCESS_PASSWD`     | Access Key Secret da AWS                        |