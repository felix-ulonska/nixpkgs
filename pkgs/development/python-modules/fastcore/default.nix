{ lib
, buildPythonPackage
, fetchFromGitHub
, packaging
, pytestCheckHook
, pythonOlder
}:

buildPythonPackage rec {
  pname = "fastcore";
  version = "1.4.0";
  format = "setuptools";

  disabled = pythonOlder "3.8";

  src = fetchFromGitHub {
    owner = "fastai";
    repo = pname;
    rev = version;
    sha256 = "sha256-U7tZkqfBbl5IVZlC2/JBIx7Bm5iIiXTMSm0QHmzNiys=";
  };

  propagatedBuildInputs = [
    packaging
  ];

  # Module has no tests
  doCheck = false;

  pythonImportsCheck = [
    "fastcore"
  ];

  meta = with lib; {
    description = "Python module for Fast AI";
    homepage = "https://github.com/fastai/fastcore";
    license = with licenses; [ asl20 ];
    maintainers = with maintainers; [ fab ];
  };
}
