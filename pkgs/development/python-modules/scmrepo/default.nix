{ lib
, asyncssh
, buildPythonPackage
, dulwich
, fetchFromGitHub
, fsspec
, funcy
, GitPython
, pathspec
, pygit2
, pygtrie
, pythonOlder
}:

buildPythonPackage rec {
  pname = "scmrepo";
  version = "0.0.14";
  format = "pyproject";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "iterative";
    repo = pname;
    rev = version;
    hash = "sha256-/J8cCcGAWGrJmUvznOKXtNiHasdOJ3CzsGMeakgL0sY=";
  };

  propagatedBuildInputs = [
    asyncssh
    dulwich
    fsspec
    funcy
    GitPython
    pathspec
    pygit2
    pygtrie
  ];

  # Requires a running Docker instance
  doCheck = false;

  pythonImportsCheck = [
    "scmrepo"
  ];

  meta = with lib; {
    description = "SCM wrapper and fsspec filesystem";
    homepage = "https://github.com/iterative/scmrepo";
    license = licenses.asl20;
    maintainers = with maintainers; [ fab ];
  };
}
