# blasiol.com

Personal static site for Steven Blasiol, served from a private S3 bucket through CloudFront.

- Apex: https://blasiol.com
- www redirects to the apex
- Infrastructure is Terraform in [`infra/`](infra/)
- Site files are in [`site/`](site/)

## Deploy

Credentials come from the environment (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`). Do not put keys in this repository.

```bash
./scripts/deploy.sh
```

Or from `infra/`:

```bash
export AWS_DEFAULT_REGION=us-east-1
terraform init
terraform apply
```

The apply creates or updates:

- S3 bucket `blasiol-com-site` (private, Block Public Access, AES-256)
- ACM certificate in `us-east-1` for `blasiol.com` and `www.blasiol.com` (DNS validation)
- CloudFront distribution with Origin Access Control, HTTPS only, TLS 1.3 (`TLSv1.3_2025`)
- Route 53 alias A/AAAA records in hosted zone `Z0983518LPGNWRT3A0L7`

Terraform only manages records it creates (certificate validation CNAMEs and the CloudFront aliases). It does not delete unrelated Route 53 records.

Local Terraform state is gitignored. Keep `infra/terraform.tfstate` somewhere durable if you apply from more than one machine.
