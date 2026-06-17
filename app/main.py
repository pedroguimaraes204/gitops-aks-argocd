from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
def health():
    return {"message": "status: ok"}

@app.get("/")
def root():
    return {"message": "GitOps AKS ArgoCD - App de exemplo"}