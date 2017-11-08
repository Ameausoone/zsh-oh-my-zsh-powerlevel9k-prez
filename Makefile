# Makefile for api-product-v2

# -----------------------------------------------------------------
#        Main targets
# -----------------------------------------------------------------

help: ## print this message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'

changelog: ## update the CHANGELOG file
	conventional-changelog -p custom-angular-pom -s -i CHANGELOG.md

generate: ## Generate HTML slides in ./docs/index.html
	docker-compose up

pdf: generate  ## Generate PDF slides from HTML slides in ./docs/slides.pdf
	docker-compose -f pdf.yml up