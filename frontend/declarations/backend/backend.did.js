export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'getSelectedValues' : IDL.Func([IDL.Text], [IDL.Text, IDL.Text], ['query']),
  });
};
export const init = ({ IDL }) => { return []; };
