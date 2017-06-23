
#include <Rcpp.h>
#include <vector>

template <typename T>
class vec
{
public:
    vec(): vec_()
    {}

    T get(size_t i)
    {
        return vec_[i];
    }

    void push_back(T d)
    {
       vec_.push_back(d);
    }

private:
    std::vector<T> vec_;
};

typedef vec<double> vecd;
typedef vec<int> veci;

RCPP_MODULE(veci_module) {
    using namespace Rcpp;
    class_< veci >("veci")
    .constructor()
    .method( "push_back", &veci::push_back)
    .method( "[[", &veci::get);
}

RCPP_MODULE(vecd_module) {
    using namespace Rcpp;
    class_< vecd >("vecd")
        .constructor()
        .method( "push_back", &vecd::push_back)
        .method( "[[", &vecd::get);
}

