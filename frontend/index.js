import { backend } from 'declarations/backend';

document.addEventListener('DOMContentLoaded', () => {
  const fetchButton = document.getElementById('fetchButton');
  const resultDiv = document.getElementById('result');

  fetchButton.addEventListener('click', async () => {
    try {
      resultDiv.textContent = 'Fetching...';
      const selectedText = await backend.getSelectedText();
      resultDiv.textContent = selectedText;
    } catch (error) {
      resultDiv.textContent = `Error: ${error.message}`;
    }
  });
});
