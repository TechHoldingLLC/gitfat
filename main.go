package main

import (
	"context"
	"encoding/json"
	"flag"
	"fmt"
	"log"
	"sort"

	"github.com/google/go-github/v42/github"
	"golang.org/x/oauth2"
)

type RepoInfo struct {
	Name *string
	URL  *string
	Size *int
}

type ReposInfo []RepoInfo

func (e ReposInfo) Len() int {
	return len(e)
}

func (e ReposInfo) Less(i, j int) bool {
	return *e[i].Size > *e[j].Size
}

func (e ReposInfo) Swap(i, j int) {
	e[i], e[j] = e[j], e[i]
}

var (
	org   = flag.String("org", "TechHoldingLLC", "")
	token = flag.String("token", "", "")
)

func main() {
	flag.Parse()

	ctx := context.Background()
	ts := oauth2.StaticTokenSource(
		&oauth2.Token{AccessToken: *token},
	)
	tc := oauth2.NewClient(ctx, ts)

	client := github.NewClient(tc)

	opt := &github.RepositoryListByOrgOptions{}
	rawRepos, _, err := client.Repositories.ListByOrg(ctx, *org, opt)
	if err != nil {
		log.Fatalln(err)
	}

	repos := ReposInfo{}

	for _, r := range rawRepos {
		repos = append(repos, RepoInfo{
			Name: r.Name,
			URL:  r.HTMLURL,
			Size: r.Size,
		})
	}

	sort.Sort(ReposInfo(repos))

	reposJSON, err := json.Marshal(repos)
	if err != nil {
		log.Fatalln(err)
	}

	fmt.Println(string(reposJSON))
}
