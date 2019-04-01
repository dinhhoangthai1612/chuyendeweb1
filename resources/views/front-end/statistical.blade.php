@extends('front-end.masterpage.master')
@section('content')
    <main>
        <div class="container">
            <section>
                <h2>Danh sách các hãng bay đạt doanh thu cao nhất</h2>
                @foreach($sql as $row)
                <article>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h4><strong><a href="">{{ $row->airways_name }}</a></strong></h4>
                                            <div><span class="place"></span></div>
                                        </div>
                                        <div class="col-sm-3 text-right">
                                            <h4 class="price text-danger"><strong> {{ $row->airways_total_revanue }}</strong></h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
                @endforeach
                <div class="text-center">
                    <ul class="pagination">
                        <li><a href="#">&laquo;</a></li>
                        <li><a href="#">&lsaquo;</a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">&rsaquo;</a></li>
                        <li><a href="#">&raquo;</a></li>
                    </ul>
                </div>
            </section>
        </div>
    </main>
@stop