data {
  int I;   // number of teams
  int N;   // number of matches
  vector[I] prior_score;  // per-team ranking
  // this is a 4-column data table of per-game outcomes
  int team_1[N];
  int team_2[N];
  vector[N] score_1;
  vector[N] score_2;
}
transformed data {
  vector[N] y = score_1 - score_2;  // "modeled" data
}
parameters {
  real beta;            // common intercept
  vector[I] alpha;   // vector of per-team weights
  real<lower=0> sigma_a;   // common variance
  real<lower=0> sigma_y;  // noise term in our estimate
}
transformed parameters {
  // "mixed effects" model - common intercept + random effects
  vector[I] ability = beta * prior_score + alpha * sigma_a;
}
model {
  alpha ~ normal(0, 1); // priors on all parameters
  beta ~ normal(0, 2.5);
  sigma_a ~ normal(0, 2.5);
  sigma_y ~ normal(0, 2.5);

  y ~ student_t(7, ability[team_1] - ability[team_2], sigma_y);
}
generated quantities {
  // posterior predictive check - carry along uncertainty!!!
  // look at the last 4 games (i.e., the QuarterFinals)
  // getting the game score differentials for the semis
  vector[2] y_rep;
  {
    y_rep[1] = student_t_rng(7, ability[team_2[45]] - ability[team_2[46]], sigma_y);
    y_rep[2] = student_t_rng(7, ability[team_2[47]] - ability[team_2[48]], sigma_y);
  }
}
