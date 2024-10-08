import { backend } from 'declarations/backend';

document.getElementById('jsonForm').addEventListener('submit', async (e) => {
    e.preventDefault();
    const jsonString = document.getElementById('jsonInput').value;
    
    if (!jsonString.trim()) {
        alert('Please enter a JSON string');
        return;
    }

    try {
        const [textValue, yearValue, pageValue] = await backend.getSelectedValues(jsonString);
        document.getElementById('textResult').textContent = `Extracted Text: ${textValue || 'Not found'}`;
        document.getElementById('yearResult').textContent = `Extracted Year: ${yearValue || 'Not found'}`;
        document.getElementById('pageResult').textContent = `Extracted Page: ${pageValue || 'Not found'}`;
    } catch (error) {
        console.error('Error:', error);
        document.getElementById('textResult').textContent = 'An error occurred while processing the JSON.';
        document.getElementById('yearResult').textContent = '';
        document.getElementById('pageResult').textContent = '';
    }
});
