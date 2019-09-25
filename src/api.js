const chance = require("chance").Chance();

const MIN_DELAY_MS = 1000;
const MAX_DELAY_MS = 10000;
const DELAY_CHANCE_PCT = 10;
const ERROR_CHANCE_PCT = 10;

async function api(server) {
  server.route({
    method: "GET",
    url: "/api",
    handler: (_req, reply) => {
      const isDelayed = chance.bool({ likelihood: DELAY_CHANCE_PCT });
      const responseDelay = isDelayed
        ? chance.integer({
            min: MIN_DELAY_MS,
            max: MAX_DELAY_MS
          })
        : 0;
      const isError = chance.bool({ likelihood: ERROR_CHANCE_PCT });

      setTimeout(() => {
        if (isError) {
          return reply.code(500).send({ error: true });
        }

        return reply.code(200).send({
          data: {
            id: chance.guid(),
            firstName: chance.first(),
            lastName: chance.last(),
            email: chance.email(),
            age: chance.age()
          }
        });
      }, responseDelay);
    }
  });
}

module.exports = api;
