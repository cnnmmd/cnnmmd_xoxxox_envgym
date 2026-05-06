import sys
import gymnasium as gym

flgenv = sys.argv[1]

if flgenv == 'acr':
  env = gym.make("Acrobot-v1", render_mode="human")
if flgenv == 'cpl':
  env = gym.make("CartPole-v1", render_mode="human")
if flgenv == 'mcr':
  env = gym.make("MountainCar-v0", render_mode="human")

observation, info = env.reset(seed=42)
while True:
  action = env.action_space.sample()
  observation, reward, terminated, truncated, info = env.step(action)
  if terminated or truncated:
    observation, info = env.reset()
env.close()
