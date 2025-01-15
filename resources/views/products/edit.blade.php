<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
    <title>Edit Product - Forms | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>
    <meta name="description" content="" />
    <link rel="icon" type="image/x-icon" href="{{ asset('assets/img/favicon/favicon.ico') }}" />
    <link rel="stylesheet" href="{{ asset('assets/vendor/fonts/boxicons.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/vendor/css/core.css') }}" class="template-customizer-core-css" />
    <link rel="stylesheet" href="{{ asset('assets/vendor/css/theme-default.css') }}" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="{{ asset('assets/css/demo.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css') }}" />
    <script src="{{ asset('assets/vendor/js/helpers.js') }}"></script>
    <script src="{{ asset('assets/js/config.js') }}"></script>
</head>
<body>
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
            <div class="app-brand demo">
                <a href="{{ route('products.index') }}" class="app-brand-link">
                    <span class="app-brand-logo demo">
                        <svg width="25" viewBox="0 0 25 42" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                            <!-- SVG content here -->
                        </svg>
                    </span>
                    <span class="app-brand-text demo menu-text fw-bolder ms-2">Eni Standart Oil</span>
                </a>
                <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
                    <i class="bx bx-chevron-left bx-sm align-middle"></i>
                </a>
            </div>
            <div class="menu-inner-shadow"></div>
            <ul class="menu-inner py-1">
                <li class="menu-item active">
                    <a href="{{ route('products.index') }}" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-table"></i>
                        <div data-i18n="Tables">Товары</div>
                    </a>
                </li>
                <li class="menu-item ">
                    <a href="{{ route('categories.index') }}" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-table"></i>
                        <div data-i18n="Tables">Категории</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a href="{{ route('attributes.index') }}" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-table"></i>
                        <div data-i18n="Tables">Аттрибуты</div>
                    </a>
                </li>
                <li class="menu-item ">
                    <a href="{{ route('specifications.index') }}" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-table"></i>
                        <div data-i18n="Tables">Спецификации</div>
                    </a>
                </li>
            </ul>
        </aside>
        <div class="layout-page">
            <div class="content-wrapper">
                <div class="container-xxl flex-grow-1 container-p-y">
                    <h4 class="fw-bold py-3 mb-4">Редактировать товар</h4>
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <h5 class="card-header">Редактировать товар</h5>
                                <form action="{{ route('products.update', $product->id) }}" method="POST" enctype="multipart/form-data" class="card-body demo-vertical-spacing demo-only-element">
                                    @csrf
                                    @method('PUT')
                                    <label for="name" class="form-label">Название</label>
                                    <input type="text" class="form-control" name="name" id="name" value="{{ $product->name }}" placeholder="Введите название товара" aria-describedby="defaultFormControlHelp"/>

                                    <label for="code" class="form-label">Код товара</label>
                                    <input type="text" class="form-control" name="code" id="code" value="{{ $product->code }}" placeholder="Введите код товара" aria-describedby="defaultFormControlHelp"/>

                                    <label for="application" class="form-label">Применение</label>
                                    <textarea style="height: 200px;" class="form-control" name="application" id="application" placeholder="Введите текст" aria-describedby="defaultFormControlHelp">{{ $product->application }}</textarea>

                                    <label for="client_benefits" class="form-label">Преимущества для клиентов</label>
                                    <textarea style="height: 200px;" class="form-control" name="client_benefits" id="client_benefits" placeholder="Введите текст" aria-describedby="defaultFormControlHelp">{{ $product->client_benefits }}</textarea>

                                    <label for="warnings" class="form-label">Предупреждения</label>
                                    <input type="text" class="form-control" name="warnings" id="warnings" value="{{ $product->warnings }}" placeholder="Введите текст" aria-describedby="defaultFormControlHelp"/>

                                    <label for="eco_friendly" class="form-label">Eco Friendly</label>
                                    <input type="text" class="form-control" name="eco_friendly" id="eco_friendly" value="{{ $product->eco_friendly }}" placeholder="Введите текст" aria-describedby="defaultFormControlHelp"/>

                                    <label for="photo" class="form-label">Изображение</label>
                                    <input type="file" class="form-control" id="photo" name="photo"/>
                                    @if ($product->photo)
                                        <img src="{{ Storage::url($product->photo) }}" alt="Product image" class="img-fluid mt-2" width="150px">
                                    @endif

                                    <label for="technical_specification" class="form-label">Технические характеристики</label>
                                    <input type="file" class="form-control" id="technical_specification" name="technical_specification"/>
                                    @if ($product->technical_specification)
                                        <a href="{{ Storage::url($product->technical_specification) }}" class="d-block mt-2" target="_blank">Скачать текущий файл</a>
                                    @endif

                                    <label for="commercial_offer" class="form-label">Коммерческое предложение</label>
                                    <input type="file" class="form-control" id="commercial_offer" name="commercial_offer"/>
                                    @if ($product->commercial_offer)
                                        <a href="{{ Storage::url($product->commercial_offer) }}" class="d-block mt-2" target="_blank">Скачать текущий файл</a>
                                    @endif

                                    <button type="submit" class="btn btn-success mt-3">Сохранить изменения</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content-backdrop fade"></div>
            </div>
        </div>
    </div>
    <div class="layout-overlay layout-menu-toggle"></div>
</div>

<script src="{{ asset('assets/vendor/libs/jquery/jquery.js') }}"></script>
<script src="{{ asset('assets/vendor/libs/popper/popper.js') }}"></script>
<script src="{{ asset('assets/vendor/js/bootstrap.js') }}"></script>
<script src="{{ asset('assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js') }}"></script>
<script src="{{ asset('assets/vendor/js/menu.js') }}"></script>
<script src="{{ asset('assets/js/main.js') }}"></script>
<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>
