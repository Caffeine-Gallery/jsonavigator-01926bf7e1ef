export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'getSelectedText' : IDL.Func([IDL.Text], [IDL.Text], ['query']),
  });
};
export const init = ({ IDL }) => { return []; };
