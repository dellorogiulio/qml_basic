#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QString>

class Backend : public QObject
{
    Q_OBJECT


    Q_PROPERTY(QString myString READ getMyString WRITE setMyString NOTIFY myStringChanged)

signals:
    void myStringChanged();


public slots:
    QString getMyString() const;
    void setMyString(const QString& new_string);

    int myFunc() { return 8; }

public:
    Backend(QObject* parent = nullptr);
    Q_INVOKABLE int myFunc2() { return 82; }


private:
    QString my_string_;
};

#endif  // BACKEND_H
