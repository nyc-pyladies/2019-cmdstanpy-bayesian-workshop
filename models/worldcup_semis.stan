data {
  int I;   // number of teams
  int N;   // number of matches
  vector[I] spi_std;  // per-team ranking
  // this is a 4-column data table of per-game outcomes
  int team_1[N];
  int team_2[N];
  vector[N] score_1;
  vector[N] score_2;
  int team_1_semis[2];  // these hold indices into 
  int team_2_semis[2];  // the vector of abilities
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
  vector[I] ability = beta * spi_std + alpha * sigma_a;
}
model {
  alpha ~ normal(0, 1); // priors on all parameters
  beta ~ normal(0, 2.5);
  sigma_a ~ normal(0, 2.5);
  sigma_y ~ normal(0, 2.5);

  y ~ student_t(7, ability[team_1] - ability[team_2], sigma_y);
}
generated quantities {
  // now estimate the semi-finals based on ability up through semis
  vector[2] semis;
  for (n in 1:2) {
    semis[n] = student_t_rng(7, ability[team_1_semis[n]] - ability[team_2_semis[n]], sigma_y);
  }

}
