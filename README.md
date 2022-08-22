# web page for:
https://rogithub.github.io/papeleria/


## local deployment
podman build -f Containerfile -t papeleria-hugo-img

podman run -d --name papeleria-hugo -p 1313:80 papeleria-hugo-img

podman exec -it papeleria-hugo bash