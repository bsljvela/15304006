const API_URL = import.meta.env.VITE_BASE_API_URL

export async function loginApi (formData) {
    try {
        const url = `${API_URL}/api/v1/auth/token/`
        console.log('url', url)
        const params = {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(formData)
        }

        const response = await fetch(url, params)

        if (response.status !== 200) {
            throw new Error('Usuario o contraseña incorrecta')
        }

        const result = await response.json()
        return result
    } catch (error) {
        throw new Error(error)
    }
}