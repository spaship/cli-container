# SPAShip CLI Container [![Docker Repository on Quay](https://quay.io/repository/redhat_emp1/spaship-cli/status "Docker Repository on Quay")](https://quay.io/repository/redhat_emp1/spaship-cli)

A self-contained SPAShip CLI container image to simplify your SPA deployments via SPAShip.

This repository provides a container image hosted at [quay.io/redhat_emp1/spaship-cli](https://quay.io/redhat_emp1/spaship-cli) for running the SPAShip CLI tool in a containerized environment.

#### Advantages
- Seamless integration with GitLab and GitHub CI/CD pipelines
- Ensures the use of the latest SPAShip CLI version automatically, as the image is consistently updated with new releases
- Eliminates external dependencies such as Node.js
- Simplifies setup and reduces manual configuration
- Ensures consistency across different environments
- Minimizes potential compatibility issues

### Usage
```bash
podman run -v "$(pwd):/app" -it --rm quay.io/redhat_emp1/spaship-cli <SPAShip CLI command-line arguments>
```
### Creating a new SPA
To create a SPA using the SPAShip CLI, use the following command:

```bash
podman run -v "$(pwd):/app" -it --rm quay.io/redhat_emp1/spaship-cli init
```
### Deploying a SPA

To deploy a SPA using the SPAShip CLI, use the following command:

```bash
podman run -v "$(pwd):/app" -it --rm quay.io/redhat_emp1/spaship-cli deploy
```

This mounts your current working directory into the `/app` directory inside the container.

### Check the current CLI Version

You can run the container and check the current SPAShip CLI version with the following command:

```bash
podman run --rm quay.io/redhat_emp1/spaship-cli
```

## License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.