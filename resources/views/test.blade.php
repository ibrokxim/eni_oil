<div class="container">
    <button id="getTokenBtn" class="btn btn-primary">Получить токен</button>

    <div class="mt-3">
        <label>Токен:</label>
        <input type="text" id="tokenInput" class="form-control" readonly>
    </div>
</div>

@push('scripts')
    <script>
        document.getElementById('getTokenBtn').addEventListener('click', function() {
            fetch('/atmos-token', {
                method: 'POST',
                headers: {
                    'X-CSRF-TOKEN': '{{ csrf_token() }}',
                    'Content-Type': 'application/json',
                    'Accept': 'application/json'
                }
            })
                .then(response => response.json())
                .then(data => {
                    if (data.token) {
                        document.getElementById('tokenInput').value = data.token;
                    } else {
                        document.getElementById('tokenInput').value = 'Токен не получен';
                        console.error('Token error:', data);
                    }
                })
                .catch(error => {
                    document.getElementById('tokenInput').value = 'Ошибка получения токена';
                    console.error('Fetch error:', error);
                });
        });
    </script>
@endpush
