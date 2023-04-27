# Load an external environment file

> [https://gist.github.com/mihow/9c7f559807069a03e302605691f85572?permalink_comment_id=3954807#gistcomment-3954807](https://gist.github.com/mihow/9c7f559807069a03e302605691f85572?permalink_comment_id=3954807#gistcomment-3954807)

Imagine you've a `.env` file like

```env
DOCKER_DATABASE_USE_MIGRATION="N"
DOCKER_ENABLE_SYNCHRONIZATION="Y"
DOCKER_GIT_USEREMAIL="christophe@me.com"
DOCKER_GIT_USERNAME="Me and myself"
```

You can load that file easily in your environment using the following instructions:

```bash
set -o allexport
source .env set
set +o allexport
```

This done, variables will be accessible like any environment variables in your bash script. When the script exit, the added variables are removed (just like in a sub-shell).

Using `source` is the best solution to avoid problems with f.i. spaces like in `"Me and myself"` i.e. using others solution like `export $(... | xargs)` will always gives unpredictable results.

