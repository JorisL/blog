# jorisl_website
Personal website - jorisl.nl

Blog is generated using [marmite](https://rochacbruno.github.io/marmite/)

## Adding a new page

1. Open terminal within the `jorisl_blog` directory
2. Run `marmite --new "{post_title}" .` in the terminal, or duplicate an existing post.
3. Add markdown front matter (see existing entries for reference)
4. if not a post to be seen on front page: add stream name before date to filename.
    (edit `marmite.yaml` to add new stream name, if required)

## Re-building the website

1. Open terminal within the `jorisl_blog` directory
2. Run `marmite .` in the terminal

or

1. Open project in sublime text
2. Run `ctrl-b`

Then:

1. Open terminal within the `jorisl_blog` directory
2. Run `python3 -m http.server` in the terminal