import { backend } from 'declarations/backend';

document.getElementById('jsonForm').addEventListener('submit', async (e) => {
    e.preventDefault();
    const jsonString = document.getElementById('jsonInput').value;
    
    if (!jsonString.trim()) {
        alert('Please enter a JSON string');
        return;
    }

    try {
        const result = await backend.getSelectedText(jsonString);
        document.getElementById('result').textContent = `Extracted Text: ${result}`;
    } catch (error) {
        console.error('Error:', error);
        document.getElementById('result').textContent = 'An error occurred while processing the JSON.';
    }
});
