const database = [
  { name: 'John Doe', email: 'john@doe.com' },
  { name: 'Jane Doe', email: 'jane@doe.com' }
];

async function getUser(userId: number) {
  return database[userId] || database[0];
}

export async function data(context: any, callback: (error: any, data: any) => void) {
  const { userId } = context.params;
  const { email, name } = await getUser(userId);

  return callback(null, {
    userId,
    name,
    email
  });
}
