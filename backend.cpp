#include <backend.h>

Backend::Backend(QObject* parent) :
    QObject(parent),
    my_string_("default")
{


    connect(this, &Backend::myStringChanged, this, [](){
       // save to file
    });

}

QString Backend::getMyString() const
{
    return my_string_;
}

void Backend::setMyString(const QString& new_string)
{
    if (my_string_ == new_string)
        return;
    my_string_ = new_string;
    emit myStringChanged();
}
